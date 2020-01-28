import {
  Count,
  CountSchema,
  Filter,
  repository,
  Where,
  FilterBuilder,
  WhereBuilder,
} from '@loopback/repository';
import {
  post,
  param,
  get,
  getFilterSchemaFor,
  getModelSchemaRef,
  getWhereSchemaFor,
  patch,
  put,
  del,
  requestBody,
} from '@loopback/rest';
import {Course} from '../models';
import {CourseRepository, ProductRepository} from '../repositories';
import {CommonController} from './common.controller';

export class CourseController {
  private commonController: CommonController;
  constructor(
    @repository(CourseRepository)
    public courseRepository: CourseRepository,
    @repository(ProductRepository)
    public productRepository: ProductRepository,
  ) {
    this.commonController = new CommonController(productRepository);
  }

  // @post('/courses', {
  //   responses: {
  //     '200': {
  //       description: 'Course model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Course)}},
  //     },
  //   },
  // })
  // async create(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Course, {
  //           title: 'NewCourse',
  //           exclude: ['id'],
  //         }),
  //       },
  //     },
  //   })
  //   course: Omit<Course, 'id'>,
  // ): Promise<Course> {
  //   return this.courseRepository.create(course);
  // }

  // @get('/courses/count', {
  //   responses: {
  //     '200': {
  //       description: 'Course model count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async count(
  //   @param.query.object('where', getWhereSchemaFor(Course)) where?: Where<Course>,
  // ): Promise<Count> {
  //   return this.courseRepository.count(where);
  // }

  @get('/{productname}/courses', {
    responses: {
      '200': {
        description: 'Array of Course model instances',
        content: {
          'application/json': {
            schema: {type: 'array', items: getModelSchemaRef(Course)},
          },
        },
      },
    },
  })
  async find(
    @param.path.string('productname') productname: string,
    @param.query.number('literacyLvl') literacyLvl: number,
    @param.query.number('numeracyLvl') numeracyLvl: number,
    @param.query.number('digitalSkillsLvl') digitalSkillsLvl: number,
    @param.query.string('location') location: string,
  ): Promise<Course[]> {
    const productid = await this.commonController.checkProduct(productname);
    const filter = this.createFilter(
      productid,
      literacyLvl,
      numeracyLvl,
      digitalSkillsLvl,
      location,
    );
    return this.courseRepository.find(filter);
  }

  // @patch('/courses', {
  //   responses: {
  //     '200': {
  //       description: 'Course PATCH success count',
  //       content: {'application/json': {schema: CountSchema}},
  //     },
  //   },
  // })
  // async updateAll(
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Course, {partial: true}),
  //       },
  //     },
  //   })
  //   course: Course,
  //   @param.query.object('where', getWhereSchemaFor(Course)) where?: Where<Course>,
  // ): Promise<Count> {
  //   return this.courseRepository.updateAll(course, where);
  // }

  // @get('/courses/{id}', {
  //   responses: {
  //     '200': {
  //       description: 'Course model instance',
  //       content: {'application/json': {schema: getModelSchemaRef(Course)}},
  //     },
  //   },
  // })
  // async findById(@param.path.number('id') id: number): Promise<Course> {
  //   return this.courseRepository.findById(id);
  // }

  // @patch('/courses/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Course PATCH success',
  //     },
  //   },
  // })
  // async updateById(
  //   @param.path.number('id') id: number,
  //   @requestBody({
  //     content: {
  //       'application/json': {
  //         schema: getModelSchemaRef(Course, {partial: true}),
  //       },
  //     },
  //   })
  //   course: Course,
  // ): Promise<void> {
  //   await this.courseRepository.updateById(id, course);
  // }

  // @put('/courses/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Course PUT success',
  //     },
  //   },
  // })
  // async replaceById(
  //   @param.path.number('id') id: number,
  //   @requestBody() course: Course,
  // ): Promise<void> {
  //   await this.courseRepository.replaceById(id, course);
  // }

  // @del('/courses/{id}', {
  //   responses: {
  //     '204': {
  //       description: 'Course DELETE success',
  //     },
  //   },
  // })
  // async deleteById(@param.path.number('id') id: number): Promise<void> {
  //   await this.courseRepository.deleteById(id);
  // }

  createFilter(
    productid: number,
    literacyLvl: number,
    numeracyLvl: number,
    digitalSkillsLvl: number,
    location: string,
  ): Filter<Course> {
    const filter = new FilterBuilder<Course>();
    filter
      .fields({
        id: true,
        product: true,
        name: true,
        title: true,
        description: true,
        level: true,
        skill: true,
        location: true,
        date: true,
        link: true,
      })
      .offset(0)
      .order('id ASC')
      .where({
        product: productid,
        date: {
          gte: new Date().toString(),
        },
        location,
        or: [
          {
            and: [
              {
                skill: 'literacy',
              },
              {
                level: literacyLvl,
              },
            ],
          },
          {
            and: [
              {
                skill: 'numeracy',
              },
              {
                level: numeracyLvl,
              },
            ],
          },
          {
            and: [
              {
                skill: 'digital_skills',
              },
              {
                level: digitalSkillsLvl,
              },
            ],
          },
        ],
      });
    return filter.build();
  }
}
