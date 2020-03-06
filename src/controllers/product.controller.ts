import {Filter, repository, FilterBuilder} from '@loopback/repository';
import {param, get, getModelSchemaRef} from '@loopback/rest';
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

  // @post('/products', {
  //   responses: {
  //     '200': {
  //       description: 'Product model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Product)}},
  //     },
  //   },
  // })
  // async create(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Product, {
  //           title: 'NewProduct',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   })
  //   product: Omit<Product, 'id'>,
  // ): Promise<Product> {
  //   return this.productRepository.create(product);
  // }

  // @get('/products/count', {
  //   responses: {
  //     '200': {
  //       description: 'Product model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.query.object('where', getWhereSchemaFor(Product)) where?: Where<Product>,
  // ): Promise<Count> {
  //   return this.productRepository.count(where);
  // }

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

  // @patch('/products', {
  //   responses: {
  //     '200': {
  //       description: 'Product PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Product, {partial: true}),
  //       },
  //     },
  //   })
  //   product: Product,
  //   @param.query.object('where', getWhereSchemaFor(Product)) where?: Where<Product>,
  // ): Promise<Count> {
  //   return this.productRepository.updateAll(product, where);
  // }

  // @get('/products/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'Product model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Product)}},
  //     },
  //   },
  // })
  // async findById(@param.path.number('id') id: number): Promise<Product> {
  //   return this.productRepository.findById(id);
  // }

  // @patch('/products/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Product PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Product, {partial: true}),
  //       },
  //     },
  //   })
  //   product: Product,
  // ): Promise<void> {
  //   await this.productRepository.updateById(id, product);
  // }

  // @put('/products/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Product PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() product: Product,
  // ): Promise<void> {
  //   await this.productRepository.replaceById(id, product);
  // }

  // @del('/products/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Product DELETE success',
  //     },
  //   },
  // })
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.productRepository.deleteById(id);
  // }

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
