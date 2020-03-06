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

  // @post('/categories', {
  //   responses: {
  //     '200': {
  //       description: 'Category model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Category)}},
  //     },
  //   },
  // })
  // async create(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Category, {
  //           title: 'NewCategory',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   })
  //   category: Omit<Category, 'id'>,
  // ): Promise<Category> {
  //   return this.categoryRepository.create(category);
  // }

  // @get('/categories/count', {
  //   responses: {
  //     '200': {
  //       description: 'Category model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.query.object('where', getWhereSchemaFor(Category)) where?: Where<Category>,
  // ): Promise<Count> {
  //   return this.categoryRepository.count(where);
  // }

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

  // @patch('/categories', {
  //   responses: {
  //     '200': {
  //       description: 'Category PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Category, {partial: true}),
  //       },
  //     },
  //   })
  //   category: Category,
  //   @param.query.object('where', getWhereSchemaFor(Category)) where?: Where<Category>,
  // ): Promise<Count> {
  //   return this.categoryRepository.updateAll(category, where);
  // }

  // @get('/categories/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'Category model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Category)}},
  //     },
  //   },
  // })
  // async findById(@param.path.number('id') id: number): Promise<Category> {
  //   return this.categoryRepository.findById(id);
  // }

  // @patch('/categories/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Category PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Category, {partial: true}),
  //       },
  //     },
  //   })
  //   category: Category,
  // ): Promise<void> {
  //   await this.categoryRepository.updateById(id, category);
  // }

  // @put('/categories/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Category PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() category: Category,
  // ): Promise<void> {
  //   await this.categoryRepository.replaceById(id, category);
  // }

  // @del('/categories/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Category DELETE success',
  //     },
  //   },
  // })
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.categoryRepository.deleteById(id);
  // }

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
