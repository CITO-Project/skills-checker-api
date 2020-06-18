import { Entity, model, property, belongsTo } from '@loopback/repository';
import { Product } from './product.model';
import { Scenario } from './scenario.model';

@model({ settings: { strict: false } })
export class Question extends Entity {
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
  type: string;

  @property({
    type: 'string',
  })
  pedagogical_type?: string;

  @property({
    type: 'string',
    required: true,
  })
  question: string;

  @property({
    type: 'string',
  })
  description?: string;

  // Define well-known properties here

  // Indexer property to allow additional data
  // eslint-disable-next-line @typescript-eslint/no-explicit-any
  [prop: string]: any;

  @belongsTo(() => Product)
  product: number;

  @belongsTo(() => Scenario)
  scenario: number;

  constructor(data?: Partial<Question>) {
    super(data);
  }
}

export interface QuestionRelations {
  // describe navigational properties here
}

export type QuestionWithRelations = Question & QuestionRelations;
