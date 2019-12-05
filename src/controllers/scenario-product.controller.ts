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
  Product,
} from '../models';
import {ScenarioRepository} from '../repositories';

export class ScenarioProductController {
  constructor(
    @repository(ScenarioRepository)
    public scenarioRepository: ScenarioRepository,
  ) { }

  @get('/scenarios/{id}/product', {
    responses: {
      '200': {
        description: 'Product belonging to Scenario',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Product)},
          },
        },
      },
    },
  })
  async getProduct(
    @param.path.number('id') id: typeof Scenario.prototype.id,
  ): Promise<Product> {
    return this.scenarioRepository.product(id);
  }
}
