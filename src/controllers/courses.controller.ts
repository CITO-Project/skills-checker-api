import {get} from '@loopback/rest';
import {JSONObject} from '@loopback/core';

export class HelloController {
  @get('/courses')
  retrieve(): JSONObject[] {
    return [
      {
        id: 1,
        name: 'course1',
        text: 'Learn how to use a booking website',
        link: 'http://www.example.org/1',
        area: 'dublin',
      },
      {
        id: 2,
        name: 'course2',
        text: 'Learn how to pay with your credit card',
        link: 'http://www.example.org/2',
        area: 'kildare',
      },
      {
        id: 3,
        name: 'course3',
        text: 'Learn how to use this website',
        link: 'http://www.example.org/3',
        area: 'meath',
      },
      {
        id: 4,
        name: 'course4',
        text: 'Learn how to use something else',
        link: 'http://www.example.org/4',
        area: 'wicklow',
      },
    ];
  }
}
