
exports.up = function(knex, Promise) {
  return knex.schema.createTable('comments', function (table) {
    table.integer('resource_id');
    table.integer('user_id');
    table.text('text');
    table.timestamp('created_at').defaultTo(knex.fn.now());
    table.foreign('resource_id')
    .references('resources.id');
    table.foreign('user_id')
    .references('users.id');
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('comments');
};
