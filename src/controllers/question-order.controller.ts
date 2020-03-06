import {Filter, repository, FilterBuilder} from '@loopback/repository';
import {param, get, getModelSchemaRef} from '@loopback/rest';
import {QuestionOrder} from '../models';
import {QuestionOrderRepository, ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

export class QuestionOrderController {
  private commonController: CommonController;
  constructor(
    @repository(QuestionOrderRepository)
    public questionOrderRepository: QuestionOrderRepository,
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  @get('/{productname}/questionorder', {
    responses: {
      '200': {
        description: 'Array of QuestionOrder model instances',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(QuestionOrder)},
          },
        },
      },
    },
  })
  async find(
    @param.path.string('productname') productname: string,
  ): Promise<QuestionOrder[]> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(productid);
    return this.questionOrderRepository.find(filter);
  }

  createFilter(productid: number): Filter<QuestionOrder> {
    const filter = new FilterBuilder<QuestionOrder>();
    filter
      .fields({
        id: true,
        product: true,
        name: true,
        order: true,
        description: true,
      })
      .offset(0)
      .order('order ASC')
      .where({
        product: productid,
      });
    return filter.build();
  }
}
