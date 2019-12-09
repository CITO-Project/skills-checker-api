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
import {Scenario} from '../models';
import {ScenarioRepository, ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

export class ScenarioController {
  private commonController: CommonController;
  constructor(
    @repository(ScenarioRepository)
    public scenarioRepository: ScenarioRepository,
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  // @post('/scenarios', {
  //   responses: {
  //     '200': {
  //       description: 'Scenario model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Scenario)}},
  //     },
  //   },
  // })
  // async create(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Scenario, {
  //           title: 'NewScenario',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   })
  //   scenario: Omit<Scenario, 'id'>,
  // ): Promise<Scenario> {
  //   return this.scenarioRepository.create(scenario);
  // }

  // @get('/scenarios/count', {
  //   responses: {
  //     '200': {
  //       description: 'Scenario model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.query.object('where', getWhereSchemaFor(Scenario)) where?: Where<Scenario>,
  // ): Promise<Count> {
  //   return this.scenarioRepository.count(where);
  // }

  @get(
    '/{productname}/categories/{categoryid}/interests/{interestid}/scenarios',
    {
      responses: {
        '200': {
          description: 'Array of Scenario model instances',
          content: {
            'application/json': {
              schema: {type: 'array', items: getModelSchemaRef(Scenario)},
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
  ): Promise<Scenario[]> {
    let filter = this.initializeFilter();
    let productid = await this.commonController.checkProduct(productname);
    this.setFilter(filter, productid, interestid);
    return this.scenarioRepository.find(filter);
  }

  // @patch('/scenarios', {
  //   responses: {
  //     '200': {
  //       description: 'Scenario PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Scenario, {partial: true}),
  //       },
  //     },
  //   })
  //   scenario: Scenario,
  //   @param.query.object('where', getWhereSchemaFor(Scenario)) where?: Where<Scenario>,
  // ): Promise<Count> {
  //   return this.scenarioRepository.updateAll(scenario, where);
  // }

  // @get('/scenarios/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'Scenario model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Scenario)}},
  //     },
  //   },
  // })
  // async findById(@param.path.number('id') id: number): Promise<Scenario> {
  //   return this.scenarioRepository.findById(id);
  // }

  // @patch('/scenarios/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Scenario PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Scenario, {partial: true}),
  //       },
  //     },
  //   })
  //   scenario: Scenario,
  // ): Promise<void> {
  //   await this.scenarioRepository.updateById(id, scenario);
  // }

  // @put('/scenarios/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Scenario PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() scenario: Scenario,
  // ): Promise<void> {
  //   await this.scenarioRepository.replaceById(id, scenario);
  // }

  // @del('/scenarios/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Scenario DELETE success',
  //     },
  //   },
  // })
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.scenarioRepository.deleteById(id);
  // }

  initializeFilter(): Filter<Scenario> {
    return this.commonController.initializeFilter('Scenario');
  }

  setFilter(
    filter: Filter<Scenario>,
    productid: number,
    interestid: number,
  ): void {
    filter.where = {
      product: productid,
      interest: interestid,
    };
  }
}
