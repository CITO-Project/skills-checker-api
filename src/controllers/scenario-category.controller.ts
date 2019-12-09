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
  Category,
} from '../models';
import {ScenarioRepository} from '../repositories';

export class ScenarioCategoryController {
  constructor(
    @repository(ScenarioRepository)
    public scenarioRepository: ScenarioRepository,
  ) { }

  @get('/scenarios/{id}/category', {
    responses: {
      '200': {
        description: 'Category belonging to Scenario',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Category)},
          },
        },
      },
    },
  })
  async getCategory(
    @param.path.number('id') id: typeof Scenario.prototype.id,
  ): Promise<Category> {
    return this.scenarioRepository.category(id);
  }
}
