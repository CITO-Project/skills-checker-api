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
import {Interest} from '../models';
import {InterestRepository, ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

export class InterestController {
  private commonController: CommonController;
  constructor(
    @repository(InterestRepository)
    public interestRepository: InterestRepository,
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  // @post('/interests', {
  //   responses: {
  //     '200': {
  //       description: 'Interest model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Interest)}},
  //     },
  //   },
  // })
  // async create(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Interest, {
  //           title: 'NewInterest',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   })
  //   interest: Omit<Interest, 'id'>,
  // ): Promise<Interest> {
  //   return this.interestRepository.create(interest);
  // }

  // @get('/interests/count', {
  //   responses: {
  //     '200': {
  //       description: 'Interest model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.query.object('where', getWhereSchemaFor(Interest)) where?: Where<Interest>,
  // ): Promise<Count> {
  //   return this.interestRepository.count(where);
  // }

  @get('/{productname}/categories/{categoryid}/interests', {
    responses: {
      '200': {
        description: 'Array of Interest model instances',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Interest)},
          },
        },
      },
    },
  })
  async find(
    @param.path.string('productname') productname: string,
    @param.path.number('categoryid') categoryid: number,
  ): Promise<Interest[]> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(productid, categoryid);
    return this.interestRepository.find(filter);
  }

  // @patch('/interests', {
  //   responses: {
  //     '200': {
  //       description: 'Interest PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Interest, {partial: true}),
  //       },
  //     },
  //   })
  //   interest: Interest,
  //   @param.query.object('where', getWhereSchemaFor(Interest)) where?: Where<Interest>,
  // ): Promise<Count> {
  //   return this.interestRepository.updateAll(interest, where);
  // }

  // @get('/interests/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'Interest model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Interest)}},
  //     },
  //   },
  // })
  // async findById(@param.path.number('id') id: number): Promise<Interest> {
  //   return this.interestRepository.findById(id);
  // }

  // @patch('/interests/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Interest PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Interest, {partial: true}),
  //       },
  //     },
  //   })
  //   interest: Interest,
  // ): Promise<void> {
  //   await this.interestRepository.updateById(id, interest);
  // }

  // @put('/interests/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Interest PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() interest: Interest,
  // ): Promise<void> {
  //   await this.interestRepository.replaceById(id, interest);
  // }

  // @del('/interests/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Interest DELETE success',
  //     },
  //   },
  // })
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.interestRepository.deleteById(id);
  // }

  createFilter(productid: number, categoryid: number): Filter<Interest> {
    const filter = new FilterBuilder<Interest>();
    filter
      .fields({
        id: true,
        product: true,
        category: true,
        name: true,
        text: true,
        resource: true,
        description: true,
      })
      .offset(0)
      .order('id ASC')
      .where({
        product: productid,
        category: categoryid,
      });
    return filter.build();
  }
}
