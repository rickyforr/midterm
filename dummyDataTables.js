exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('comments').del()
    .then(function () { return knex('resource_tags').del() })
    .then(function () { return knex('ratings').del() })
    .then(function () { return knex('likes').del() })
    .then(function () { return knex('tags').del() })
    .then(function () { return knex('resources').del() })
    .then(function () { return knex('users').del() })
    .then(function () {
      return Promise.all([
        // Inserts users seed entries
        knex('users').insert({id: 1, name: 'Alice', email: 'resourcewall@yahoo.com', password: '123'}),
        knex('users').insert({id: 2, name: 'Bob', email: 'misterveale@gmail.com', password: '123'}),
        knex('users').insert({id: 3, name: 'Charlie', email: 'resourcewall@gmail.com', password: '123'}),
        knex('users').insert({id: 4, name: 'Dan', email: 'dan@gmail.com', password: '123'})
      ])
    }).then(function () {
      return Promise.all([
        // Inserts resources seed entries
        knex('resources').insert({id: 1, user_id: 1, url: 'www.lighthouselabs.ca', title: 'We make developers!',
          description: 'Lighthouse Labs in 2013 by a group of software developers with a passion for code, mentorship, and education. They offer various courses and learning materials for anyone interested in advancing their coding knowledge.',
          likes_count: 2, avg_rating: 3, comments_count: 2, media_src: "https://lighthouselabs.ca/assets/lighthouselabs-logo-d5df6d383f7466b06a64de9561fd537493502eafe78bbf3bcd3de82884e5dd85.png"}),
        knex('resources').insert({id: 2, user_id: 3, url: 'www.yahoo.com', title: 'Yahoo!',
          description: 'The word yahoo is a backronym for Yet Another Hierarchically Organized Oracle or Yet Another Hierarchical Officious Oracle. It\'s like google.',
          likes_count: 2, avg_rating: 3, comments_count: 1,
          media_src: "https://vignette2.wikia.nocookie.net/logopedia/images/3/35/Yahoo_Logo.png/revision/latest?cb=20101130020430"}),
        knex('resources').insert({id: 3, user_id: 1, url: 'http://mashable.com/', title: 'mashable  wtf - whats dis4',
          description: 'Mashable is the go-to source for tech, digital culture and entertainment content for its dedicated and influential audience around the globe.',
          likes_count: 0, avg_rating: 5, comments_count: 1,
          media_src: "http://www.labsoflatvia.com/content/posts/post-image-562f7c1b4e4807.77084819.png"}),
        knex('resources').insert({id: 4, user_id: 2, url: 'https://www.ultimate-guitar.com/', title: 'Ultimate Guitar Tabs',
          description: 'Large amount of guitar tabs posted by users and ranked based on popularity. Great for learning those songs you know and love.',
          likes_count: 0, avg_rating: 5, comments_count: 1,
          media_src: "https://images-na.ssl-images-amazon.com/images/I/51%2BDbYWvE9L.png"})
      ])
    }).then(function () {
      return Promise.all([
        // Inserts categories seed entries
        knex('tags').insert({id: 1, name: 'Art'}),
        knex('tags').insert({id: 2, name: 'Biology'}),
        knex('tags').insert({id: 3, name: 'Geography'}),
        knex('tags').insert({id: 4, name: 'Business'}),
        knex('tags').insert({id: 5, name: 'Music'}),
        knex('tags').insert({id: 6, name: 'Tech'}),
        knex('tags').insert({id: 7, name: 'Food'}),
        knex('tags').insert({id: 8, name: 'Philosophy'}),
        knex('tags').insert({id: 9, name: 'Engineering'}),
        knex('tags').insert({id: 10, name: 'Photography'}),
        knex('tags').insert({id: 11, name: 'Other'})

      ])
    }).then(function () {
      return Promise.all([
        // Inserts likes seed entries
        knex('likes').insert({resource_id: 2, user_id: 1}),
        knex('likes').insert({resource_id: 1, user_id: 2}),
        knex('likes').insert({resource_id: 2, user_id: 3}),
        knex('likes').insert({resource_id: 1, user_id: 3})
      ])
    }).then(function () {
      return Promise.all([
        // Inserts ratings seed entries
        knex('ratings').insert({resource_id: 3, user_id: 1, value: 5}),
        knex('ratings').insert({resource_id: 1, user_id: 2, value: 4}),
        knex('ratings').insert({resource_id: 2, user_id: 3, value: 3}),
        knex('ratings').insert({resource_id: 1, user_id: 3, value: 1})
      ])
    }).then(function () {
      return Promise.all([
        // Inserts resource_categories seed entries
        knex('resource_categories').insert({resource_id: 3, tag_id: 6}),
        knex('resource_categories').insert({resource_id: 1, tag_id: 6}),
        knex('resource_categories').insert({resource_id: 2, tag_id: 11}),
        knex('resource_categories').insert({resource_id: 1, tag_id: 3})
      ])
    }).then(function () {
      return Promise.all([
        // Inserts comments seed entries
        knex('comments').insert({id: 1, resource_id: 3, user_id: 1, text: 'Awesome!!'}),
        knex('comments').insert({id: 2, resource_id: 1, user_id: 2, text: 'The book was a better teacher and had a better personality.'}),
        knex('comments').insert({id: 3, resource_id: 2, user_id: 3, text: 'It\'s okay.'}),
        knex('comments').insert({id: 4, resource_id: 1, user_id: 3, text: 'So good, the best.'}),
        knex('comments').insert({id: 5, resource_id: 4, user_id: 4, text: 'Learned stairway to heaven! Now everyone loves me at parties.'})

      ]);
    });
};
