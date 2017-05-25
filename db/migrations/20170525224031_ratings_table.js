exports.up = function(knex, Promise) {
  return knex.schema.createTable('ratings', function (table) {
    table.integer('user_id');
    table.integer('resource_id');
    table.integer('value');
    table.foreign('resource_id')
    .references('resources.id');
    table.foreign('user_id')
    .references('users.id');
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('ratings');
};

