import {Entity, model, property, belongsTo} from '@loopback/repository';
import {Product} from './product.model';
import {Category} from './category.model';

@model()
export class Interest extends Entity {
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
  name: string;

  @property({
    type: 'string',
    required: true,
  })
  text: string;

  @property({
    type: 'string',
  })
  resource?: string;

  @property({
    type: 'string',
  })
  description?: string;

  @belongsTo(() => Product)
  product: number;

  @belongsTo(() => Category)
  category: number;

  constructor(data?: Partial<Interest>) {
    super(data);
  }
}

export interface InterestRelations {
  // describe navigational properties here
}

export type InterestWithRelations = Interest & InterestRelations;
