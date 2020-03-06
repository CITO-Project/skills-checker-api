import {Entity, model, property} from '@loopback/repository';

@model()
export class QuestionOrder extends Entity {
  @property({
    type: 'number',
    id: true,
    generated: true,
  })
  id?: number;

  @property({
    type: 'number',
    required: true,
  })
  product: number;

  @property({
    type: 'string',
    required: true,
  })
  name: string;

  @property({
    type: 'number',
    required: true,
  })
  order: number;

  @property({
    type: 'string',
  })
  description?: string;


  constructor(data?: Partial<QuestionOrder>) {
    super(data);
  }
}

export interface QuestionOrderRelations {
  // describe navigational properties here
}

export type QuestionOrderWithRelations = QuestionOrder & QuestionOrderRelations;
