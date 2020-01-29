import {Filter, repository, FilterBuilder} from '@loopback/repository';
import {param, get, getModelSchemaRef} from '@loopback/rest';
import {Category} from '../models';
import {CategoryRepository, ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

export class CategoryController {
  private commonController: CommonController;
  constructor(
    @repository(CategoryRepository)
    public categoryRepository: CategoryRepository,
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  @get('/{productname}/categories', {
    responses: {
      '200': {
        description: 'Array of Category model instances',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Category)},
          },
        },
      },
    },
  })
  async find(
    @param.path.string('productname') productname: string,
  ): Promise<Category[]> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(productid);
    return this.categoryRepository.find(filter);
  }

  createFilter(productid: number): Filter<Category> {
    const filter = new FilterBuilder<Category>();
    filter
      .fields({
        id: true,
        product: true,
        name: true,
        text: true,
        colour: true,
        resource: true,
        description: true,
      })
      .offset(0)
      .order('id ASC')
      .where({
        product: productid,
      });
    return filter.build();
  }
}
