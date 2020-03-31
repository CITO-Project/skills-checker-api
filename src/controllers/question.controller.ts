/* eslint-disable @typescript-eslint/camelcase */
import { Filter, repository, FilterBuilder } from '@loopback/repository';
import { param, get, getModelSchemaRef } from '@loopback/rest';
import { Question } from '../models';
import { QuestionRepository, ProductRepository, AnswerRepository } from '../repositories';
import { CommonController } from './common.controller';
import { AnswerController } from './answer.controller';

export class QuestionController {
	private commonController: CommonController;
	private answerController: AnswerController;
	constructor(
		@repository(QuestionRepository)
		public questionRepository: QuestionRepository,
		@repository(ProductRepository)
		public productRepository: ProductRepository,
		@repository(AnswerRepository)
		public answerRepository: AnswerRepository
	) {
		this.commonController = new CommonController(productRepository);
		this.answerController = new AnswerController(answerRepository, productRepository);
	}

	@get(
		'/{productname}/categories/{categoryid}/interests/{interestid}/scenarios/{scenarioid}/questions',
		{
			responses: {
				'200': {
					description: 'Array of Question model instances',
					content: {
						'application/json': {
							schema: { type: 'array', items: getModelSchemaRef(Question) },
						},
					},
				},
			},
		},
	)
	async find(
		@param.path.string('productname') productname: string,
		@param.path.number('categoryid') categoryid: number,
		@param.path.number('interestid') interestid: number,
		@param.path.number('scenarioid') scenarioid: number,
	): Promise<Question[]> {
		const productid = await this.commonController.checkProduct(productname);
		const filter = this.createFilter(productid, scenarioid);
		let questions: any[] = [];
		await this.questionRepository.find(filter).then((data: Question[]) => {
			if (data.length > 0) {
				questions = data;
			}
		});
		for (let i = 0; i < questions.length; i++) {
			const answers = await this.answerRepository.find(this.answerController.createFilter(productid, questions[i].id as number));
			questions[i].answers = answers
		}
		// console.log(questions);
		return questions;
	}

	createFilter(productid: number, scenarioid: number): Filter<Question> {
		const filter = new FilterBuilder<Question>();
		filter
			.fields({
				id: true,
				product: true,
				scenario: true,
				type: true,
				question: true,
				pedagogical_type: true,
				description: true,
			})
			.offset(0)
			.order('scenario DESC', 'id ASC')
			.where({
				and: [
					{
						product: productid,
					},
					{
						or: [
							{
								scenario: scenarioid,
							},
							{
								scenario: 0,
							},
						],
					},
				],
			});
		return filter.build();
	}

}
