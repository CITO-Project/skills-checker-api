import { Filter, repository, FilterBuilder } from '@loopback/repository';
import { param, get, getModelSchemaRef } from '@loopback/rest';
import { Interest } from '../models';
import { InterestRepository, ProductRepository } from '../repositories';
import { CommonController } from './common.controller';

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

  @get('/{productname}/categories/{categoryid}/interests', {
    responses: {
      '200': {
        description: 'Array of Interest model instances',
        content: {
          'application/json': {
            schema: { type: 'array', items: getModelSchemaRef(Interest) },
          },
        },
      },
    },
  })
  async findByCategory(
    @param.path.string('productname') productname: string,
    @param.path.number('categoryid') categoryid: number,
  ): Promise<Interest[]> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(productid, categoryid);
    return this.interestRepository.find(filter);
  }

  @get('/{productname}/interests', {
    responses: {
      '200': {
        description: 'Array of Interest model instances',
        content: {
          'application/json': {
            schema: { type: 'array', items: getModelSchemaRef(Interest) },
          },
        },
      },
    },
  })
  async find(
    @param.path.string('productname') productname: string,
  ): Promise<Interest[]> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(productid);
    return this.interestRepository.find(filter);
  }

  createFilter(productid: number, categoryid?: number): Filter<Interest> {
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
      .order('id ASC');
    const _where: any = {
      product: productid
    }
    if (!!categoryid) {
      _where['category'] = categoryid;
    }
    filter.where(_where);
    return filter.build();
  }
}
