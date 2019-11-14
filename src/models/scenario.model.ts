import {Entity, model, property} from '@loopback/repository';

@model()
export class Scenario extends Entity {
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
		required: true,
	})
	interest: number;

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
	description?: string;

	@property({
		type: 'number',
		required: true,
	})
	level: number;

	@property({
		type: 'string',
	})
	resource?: string;

	constructor(data?: Partial<Scenario>) {
		super(data);
	}
}

export interface ScenarioRelations {
	// describe navigational properties here
}

export type ScenarioWithRelations = Scenario & ScenarioRelations;
