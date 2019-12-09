import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Category,
  Product,
} from '../models';
import {CategoryRepository} from '../repositories';

export class CategoryProductController {
  constructor(
    @repository(CategoryRepository)
    public categoryRepository: CategoryRepository,
  ) { }

  @get('/categories/{id}/product', {
    responses: {
      '200': {
        description: 'Product belonging to Category',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Product)},
          },
        },
      },
    },
  })
  async getProduct(
    @param.path.number('id') id: typeof Category.prototype.id,
  ): Promise<Product> {
    return this.categoryRepository.product(id);
  }
}
