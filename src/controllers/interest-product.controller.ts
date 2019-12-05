import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Interest,
  Product,
} from '../models';
import {InterestRepository} from '../repositories';

export class InterestProductController {
  constructor(
    @repository(InterestRepository)
    public interestRepository: InterestRepository,
  ) { }

  @get('/interests/{id}/product', {
    responses: {
      '200': {
        description: 'Product belonging to Interest',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Product)},
          },
        },
      },
    },
  })
  async getProduct(
    @param.path.number('id') id: typeof Interest.prototype.id,
  ): Promise<Product> {
    return this.interestRepository.product(id);
  }
}
