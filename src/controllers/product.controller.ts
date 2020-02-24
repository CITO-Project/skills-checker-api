import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
  FilterBuilder,
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
import {Product, ProductRelations} from '../models';
import {ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

export class ProductController {
  private commonController: CommonController;
  constructor(
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  @get('/{productname}/product', {
    responses: {
      '200': {
        description: 'Array of Product model instances',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Product)},
          },
        },
      },
    },
  })
  async find(
    @param.path.string('productname') productname: string,
  ): Promise<(Product & ProductRelations) | null> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(productid);
    return this.productRepository.findOne(filter);
  }

  createFilter(productid: number): Filter<Product> {
    const filter = new FilterBuilder<Product>();
    filter
      .fields({
        id: true,
        name: true,
        description: true,
      })
      .limit(1)
      .offset(0)
      .order('id ASC')
      .where({
        id: productid,
      });
    return filter.build();
  }
}
