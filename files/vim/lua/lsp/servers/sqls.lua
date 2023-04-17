return {
  settings = {
    connections = {
      {
        driver = 'postgresql',
        dataSourceName = 'host=0.0.0.0 port=5400 user=postgres password=postgres dbname=hs-db sslmode=disable'
      }
    }
  }
}
