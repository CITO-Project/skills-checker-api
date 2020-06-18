import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Product} from './product.model';
import {Question} from './question.model';

@model()
export class Answer extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'string',
    required: true,
  })
  text: string;

  @property({
    type: 'number',
    required: true,
  })
  value: number;

  @property({
    type: 'number',
    required: true,
  })
  order: number;

  @property({
    type: 'string',
  })
  special?: string;

  @property({
    type: 'string',
  })
  skipTo?: string;

  @belongsTo(() => Product)
  product: number;

  @belongsTo(() => Question)
  question: number;

  constructor(data?: Partial<Answer>) {
    super(data);
  }
}

export interface AnswerRelations {
  // describe navigational properties here
}

export type AnswerWithRelations = Answer & AnswerRelations;
