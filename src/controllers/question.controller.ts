import {Filter, repository, FilterBuilder} from '@loopback/repository';
import {param, get, getModelSchemaRef} from '@loopback/rest';
import {Question} from '../models';
import {QuestionRepository, ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

export class QuestionController {
  private commonController: CommonController;
  constructor(
    @repository(QuestionRepository)
    public questionRepository: QuestionRepository,
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  @get(
    '/{productname}/categories/{categoryid}/interests/{interestid}/scenarios/{scenarioid}/questions',
    {
      responses: {
        '200': {
          description: 'Array of Question model instances',
          content: {
            'application/json': {
              schema: {type: 'array', items: getModelSchemaRef(Question)},
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
    return this.questionRepository.find(filter);
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
        answers: true,
        pedagogical_type: true,
        description: true,
      })
      .limit(5)
      .offset(0)
      .order('id ASC')
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
