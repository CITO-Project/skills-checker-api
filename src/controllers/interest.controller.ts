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
import {Interest} from '../models';
import {InterestRepository} from '../repositories';

export class InterestController {
  constructor(
    @repository(InterestRepository)
    public interestRepository : InterestRepository,
  ) {}

  @post('/interests', {
    responses: {
      '200': {
        description: 'Interest model instance',
        content: {'application/json': {schema: getModelSchemaRef(Interest)}},
      },
    },
  })
  async create(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Interest, {
            title: 'NewInterest',
            exclude: ['id'],
          }),
        },
      },
    })
    interest: Omit<Interest, 'id'>,
  ): Promise<Interest> {
    return this.interestRepository.create(interest);
  }

  @get('/interests/count', {
    responses: {
      '200': {
        description: 'Interest model count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async count(
    @param.query.object('where', getWhereSchemaFor(Interest)) where?: Where<Interest>,
  ): Promise<Count> {
    return this.interestRepository.count(where);
  }

  @get('/interests', {
    responses: {
      '200': {
        description: 'Array of Interest model instances',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Interest)},
          },
        },
      },
    },
  })
  async find(
    @param.query.object('filter', getFilterSchemaFor(Interest)) filter?: Filter<Interest>,
  ): Promise<Interest[]> {
    return this.interestRepository.find(filter);
  }

  @patch('/interests', {
    responses: {
      '200': {
        description: 'Interest PATCH success count',
        content: {'application/json': {schema: CountSchema}},
      },
    },
  })
  async updateAll(
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Interest, {partial: true}),
        },
      },
    })
    interest: Interest,
    @param.query.object('where', getWhereSchemaFor(Interest)) where?: Where<Interest>,
  ): Promise<Count> {
    return this.interestRepository.updateAll(interest, where);
  }

  @get('/interests/{id}', {
    responses: {
      '200': {
        description: 'Interest model instance',
        content: {'application/json': {schema: getModelSchemaRef(Interest)}},
      },
    },
  })
  async findById(@param.path.number('id') id: number): Promise<Interest> {
    return this.interestRepository.findById(id);
  }

  @patch('/interests/{id}', {
    responses: {
      '204': {
        description: 'Interest PATCH success',
      },
    },
  })
  async updateById(
    @param.path.number('id') id: number,
    @requestBody({
      content: {
        'application/json': {
          schema: getModelSchemaRef(Interest, {partial: true}),
        },
      },
    })
    interest: Interest,
  ): Promise<void> {
    await this.interestRepository.updateById(id, interest);
  }

  @put('/interests/{id}', {
    responses: {
      '204': {
        description: 'Interest PUT success',
      },
    },
  })
  async replaceById(
    @param.path.number('id') id: number,
    @requestBody() interest: Interest,
  ): Promise<void> {
    await this.interestRepository.replaceById(id, interest);
  }

  @del('/interests/{id}', {
    responses: {
      '204': {
        description: 'Interest DELETE success',
      },
    },
  })
  async deleteById(@param.path.number('id') id: number): Promise<void> {
    await this.interestRepository.deleteById(id);
  }
}
