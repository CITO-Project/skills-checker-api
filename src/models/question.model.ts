import {Entity, model, property} from '@loopback/repository';

@model()
export class Question extends Entity {
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
    type: 'number',
  })
  scenario?: number;

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
    type: 'array',
    itemType: 'string',
    required: true,
  })
  answers: string[];

  @property({
    type: 'string',
  })
  description?: string;

  constructor(data?: Partial<Question>) {
    super(data);
  }
}

export interface QuestionRelations {
  // describe navigational properties here
}

export type QuestionWithRelations = Question & QuestionRelations;
