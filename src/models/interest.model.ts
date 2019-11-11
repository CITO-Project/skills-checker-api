import {Entity, model, property} from '@loopback/repository';

@model()
export class Interest extends Entity {
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
    type: 'string',
    required: true,
  })
  text: string;

  @property({
    type: 'string',
  })
  illustration?: string;

  @property({
    type: 'string',
  })
  description?: string;


  constructor(data?: Partial<Interest>) {
    super(data);
  }
}

export interface InterestRelations {
  // describe navigational properties here
}

export type InterestWithRelations = Interest & InterestRelations;
