module Hi
  class Server
    def call(env)
      [ 200,
        { 'Content-Type' => 'text/plain' },
        ['hi']
      ]
    end
  end
end
