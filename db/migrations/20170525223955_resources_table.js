exports.up = function(knex, Promise) {
  return knex.schema.createTable('resources', function (table) {
    table.increments();
    table.string('url');
    table.string('title');
    table.text('description');
    table.integer('likes_count');
    table.integer('avg_rating');
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.integer('user_id');
    table.foreign('user_id')
    .references('users.id').onUpdate('CASCADE');
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('resources');
};


