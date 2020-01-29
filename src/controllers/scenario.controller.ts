import {Filter, repository, FilterBuilder} from '@loopback/repository';
import {param, get, getModelSchemaRef} from '@loopback/rest';
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
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(productid, interestid);
    return this.scenarioRepository.find(filter);
  }

  createFilter(productid: number, interestid: number): Filter<Scenario> {
    const filter = new FilterBuilder<Scenario>();
    filter
      .fields({
        id: true,
        product: true,
        interest: true,
        name: true,
        text: true,
        level: true,
        resource: true,
        description: true,
      })
      .limit(4)
      .offset(0)
      .order('level ASC')
      .where({
        product: productid,
        interest: interestid,
      });
    return filter.build();
  }
}
