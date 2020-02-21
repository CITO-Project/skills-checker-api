import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
  FilterBuilder,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getFilterSchemaFor,
  getModelSchemaRef,
  getWhereSchemaFor,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {Question, Category} from '../models';
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

  // @post('/questions', {
  //   responses: {
  //     '200': {
  //       description: 'Question model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Question)}},
  //     },
  //   },
  // })
  // async create(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Question, {
  //           title: 'NewQuestion',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   })
  //   question: Omit<Question, 'id'>,
  // ): Promise<Question> {
  //   return this.questionRepository.create(question);
  // }

  // @get('/questions/count', {
  //   responses: {
  //     '200': {
  //       description: 'Question model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.query.object('where', getWhereSchemaFor(Question)) where?: Where<Question>,
  // ): Promise<Count> {
  //   return this.questionRepository.count(where);
  // }

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

  // @patch('/questions', {
  //   responses: {
  //     '200': {
  //       description: 'Question PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Question, {partial: true}),
  //       },
  //     },
  //   })
  //   question: Question,
  //   @param.query.object('where', getWhereSchemaFor(Question)) where?: Where<Question>,
  // ): Promise<Count> {
  //   return this.questionRepository.updateAll(question, where);
  // }

  // @get('/questions/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'Question model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Question)}},
  //     },
  //   },
  // })
  // async findById(@param.path.number('id') id: number): Promise<Question> {
  //   return this.questionRepository.findById(id);
  // }

  // @patch('/questions/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Question PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Question, {partial: true}),
  //       },
  //     },
  //   })
  //   question: Question,
  // ): Promise<void> {
  //   await this.questionRepository.updateById(id, question);
  // }

  // @put('/questions/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Question PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() question: Question,
  // ): Promise<void> {
  //   await this.questionRepository.replaceById(id, question);
  // }

  // @del('/questions/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Question DELETE success',
  //     },
  //   },
  // })
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.questionRepository.deleteById(id);
  // }

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
      .limit(7)
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
