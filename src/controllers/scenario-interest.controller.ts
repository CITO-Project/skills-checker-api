import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Scenario,
  Interest,
} from '../models';
import {ScenarioRepository} from '../repositories';

export class ScenarioInterestController {
  constructor(
    @repository(ScenarioRepository)
    public scenarioRepository: ScenarioRepository,
  ) { }

  @get('/scenarios/{id}/interest', {
    responses: {
      '200': {
        description: 'Interest belonging to Scenario',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Interest)},
          },
        },
      },
    },
  })
  async getInterest(
    @param.path.number('id') id: typeof Scenario.prototype.id,
  ): Promise<Interest> {
    return this.scenarioRepository.interest(id);
  }
}
