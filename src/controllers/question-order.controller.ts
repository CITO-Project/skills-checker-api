import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
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
import {QuestionOrder} from '../models';
import {QuestionOrderRepository} from '../repositories';

export class QuestionOrderController {
  constructor(
    @repository(QuestionOrderRepository)
    public questionOrderRepository : QuestionOrderRepository,
  ) {}

  @post('/questionorder', {
    responses: {
      '200': {
        description: 'QuestionOrder model instance',
        content: {'application/json': {schema: getModelSchemaRef(QuestionOrder)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(QuestionOrder, {
            title: 'NewQuestionOrder',
            exclude: ['id'],
          }),
        },
      },
    })
    questionOrder: Omit<QuestionOrder, 'id'>,
  ): Promise<QuestionOrder> {
    return this.questionOrderRepository.create(questionOrder);
  }

  @get('/questionorder/count', {
    responses: {
      '200': {
        description: 'QuestionOrder model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.query.object('where', getWhereSchemaFor(QuestionOrder)) where?: Where<QuestionOrder>,
  ): Promise<Count> {
    return this.questionOrderRepository.count(where);
  }

  @get('/questionorder', {
    responses: {
      '200': {
        description: 'Array of QuestionOrder model instances',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(QuestionOrder)},
          },
        },
      },
    },
  })
  async find(
    @param.query.object('filter', getFilterSchemaFor(QuestionOrder)) filter?: Filter<QuestionOrder>,
  ): Promise<QuestionOrder[]> {
    return this.questionOrderRepository.find(filter);
  }

  @patch('/questionorder', {
    responses: {
      '200': {
        description: 'QuestionOrder PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(QuestionOrder, {partial: true}),
        },
      },
    })
    questionOrder: QuestionOrder,
    @param.query.object('where', getWhereSchemaFor(QuestionOrder)) where?: Where<QuestionOrder>,
  ): Promise<Count> {
    return this.questionOrderRepository.updateAll(questionOrder, where);
  }

  @get('/questionorder/{id}', {
    responses: {
      '200': {
        description: 'QuestionOrder model instance',
        content: {'application/json': {schema: getModelSchemaRef(QuestionOrder)}},
      },
    },
  })
  async findById(@param.path.number('id') id: number): Promise<QuestionOrder> {
    return this.questionOrderRepository.findById(id);
  }

  @patch('/questionorder/{id}', {
    responses: {
      '204': {
        description: 'QuestionOrder PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(QuestionOrder, {partial: true}),
        },
      },
    })
    questionOrder: QuestionOrder,
  ): Promise<void> {
    await this.questionOrderRepository.updateById(id, questionOrder);
  }

  @put('/questionorder/{id}', {
    responses: {
      '204': {
        description: 'QuestionOrder PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() questionOrder: QuestionOrder,
  ): Promise<void> {
    await this.questionOrderRepository.replaceById(id, questionOrder);
  }

  @del('/questionorder/{id}', {
    responses: {
      '204': {
        description: 'QuestionOrder DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.questionOrderRepository.deleteById(id);
  }
}
