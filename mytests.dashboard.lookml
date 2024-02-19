- dashboard: mytests
  title: Mytests
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
    - name: hello_world
      type: looker_column
      explore: users
      listens_to_filters: []
      field: users.state
