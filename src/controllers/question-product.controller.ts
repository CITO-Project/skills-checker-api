import {
  repository,
} from '@loopback/repository';
import {
  param,
  get,
  getModelSchemaRef,
} from '@loopback/rest';
import {
  Question,
  Product,
} from '../models';
import {QuestionRepository} from '../repositories';

export class QuestionProductController {
  constructor(
    @repository(QuestionRepository)
    public questionRepository: QuestionRepository,
  ) { }

  @get('/questions/{id}/product', {
    responses: {
      '200': {
        description: 'Product belonging to Question',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Product)},
          },
        },
      },
    },
  })
  async getProduct(
    @param.path.number('id') id: typeof Question.prototype.id,
  ): Promise<Product> {
    return this.questionRepository.product(id);
  }
}
