
exports.up = function(knex, Promise) {
  return knex.schema.createTable('tags', function (table) {
    table.increments();
    table.string('tag_name');
  });
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('tags');
};
