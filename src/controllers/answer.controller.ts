import {Filter, repository, FilterBuilder} from '@loopback/repository';
import {param, get, getModelSchemaRef} from '@loopback/rest';
import {Answer} from '../models';
import {AnswerRepository, ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

export class AnswerController {
  private commonController: CommonController;
  constructor(
    @repository(AnswerRepository)
    public answerRepository: AnswerRepository,
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  // @post('/answers', {
  //   responses: {
  //     '200': {
  //       description: 'Answer model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Answer)}},
  //     },
  //   },
  // })
  // async create(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Answer, {
  //           title: 'NewAnswer',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   })
  //   answer: Omit<Answer, 'id'>,
  // ): Promise<Answer> {
  //   return this.answerRepository.create(answer);
  // }

  // @get('/answers/count', {
  //   responses: {
  //     '200': {
  //       description: 'Answer model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.query.object('where', getWhereSchemaFor(Answer)) where?: Where<Answer>,
  // ): Promise<Count> {
  //   return this.answerRepository.count(where);
  // }

  // @get('/answers', {
  //   responses: {
  //     '200': {
  //       description: 'Array of Answer model instances',
  //       content: {
  //         'application/json': {
  //           schema: {type: 'array', items: getModelSchemaRef(Answer)},
  //         },
  //       },
  //     },
  //   },
  // })
  // async find(
  //   @param.query.object('filter', getFilterSchemaFor(Answer)) filter?: Filter<Answer>,
  // ): Promise<Answer[]> {
  //   return this.answerRepository.find(filter);
  // }

  // @patch('/answers', {
  //   responses: {
  //     '200': {
  //       description: 'Answer PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Answer, {partial: true}),
  //       },
  //     },
  //   })
  //   answer: Answer,
  //   @param.query.object('where', getWhereSchemaFor(Answer)) where?: Where<Answer>,
  // ): Promise<Count> {
  //   return this.answerRepository.updateAll(answer, where);
  // }

  @get(
    '/{productname}/categories/{categoryid}/interests/{interestid}/scenarios/{scenarioid}/questions/{questionid}/answers',
    {
      responses: {
        '200': {
          description: 'Answer model instance',
          content: {'application/json': {schema: getModelSchemaRef(Answer)}},
        },
      },
    },
  )
  async findById(
    @param.path.string('productname') productname: string,
    @param.path.number('categoryid') categoryid: number,
    @param.path.number('interestid') interestid: number,
    @param.path.number('scenarioid') scenarioid: number,
    @param.path.number('questionid') questionid: number,
  ): Promise<Answer[]> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(productid, questionid);
    return this.answerRepository.find(filter);
  }

  // @patch('/answers/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Answer PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Answer, {partial: true}),
  //       },
  //     },
  //   })
  //   answer: Answer,
  // ): Promise<void> {
  //   await this.answerRepository.updateById(id, answer);
  // }

  // @put('/answers/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Answer PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() answer: Answer,
  // ): Promise<void> {
  //   await this.answerRepository.replaceById(id, answer);
  // }

  // @del('/answers/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Answer DELETE success',
  //     },
  //   },
  // })
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.answerRepository.deleteById(id);
  // }

  createFilter(productid: number, questionid: number): Filter<Answer> {
    const filter = new FilterBuilder<Answer>();
    filter
      .fields({
        id: true,
        product: true,
        question: true,
        text: true,
        value: true,
        order: true,
        special: true,
        skipTo: true,
      })
      .offset(0)
      .order('order ASC')
      .where({
        product: productid,
        question: questionid,
      });
    return filter.build();
  }
}
