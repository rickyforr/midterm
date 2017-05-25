
exports.up = function(knex, Promise) {
  return knex.schema.createTable('resource_tags', function (table) {
    table.integer('resource_id');
    table.integer('tag_id');
    table.foreign('resource_id')
    .references('resources.id');
    table.foreign('tag_id')
    .references('tags.id');
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('resource_tags');
};
