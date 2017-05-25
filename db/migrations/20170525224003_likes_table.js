
exports.up = function(knex, Promise) {
  return knex.schema.createTable('likes', function (table) {
    table.integer('resource_id');
    table.integer('user_id');
    table.foreign('resource_id')
    .references('resources.id');
    table.foreign('user_id')
    .references('users.id');
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('likes');
};

