import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Question,
  Scenario,
} from '../models';
import {QuestionRepository} from '../repositories';

export class QuestionScenarioController {
  constructor(
    @repository(QuestionRepository)
    public questionRepository: QuestionRepository,
  ) { }

  @get('/questions/{id}/scenario', {
    responses: {
      '200': {
        description: 'Scenario belonging to Question',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Scenario)},
          },
        },
      },
    },
  })
  async getScenario(
    @param.path.number('id') id: typeof Question.prototype.id,
  ): Promise<Scenario> {
    return this.questionRepository.scenario(id);
  }
}
