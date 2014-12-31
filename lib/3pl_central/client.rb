module ThreePLCentral
  class Client
    include ::ThreePLCentral::CoreExtensions
    def initialize(params)
      ThreePLCentral.configure do |c|
        c.three_pl_key = params[:three_pl_key]
        c.login        = params[:login]
        c.password     = params[:password]
        c.three_pl_id  = params[:three_pl_id]
      end
    end

    def method_missing(meth, *args)
      if meth.to_s =~ /(create|find|get)_(.+)/
        run_method($2, $1, *args)
      else
        super
      end
    end

    def respond_to?(meth)
      if meth.to_s =~ /(create|find|get)_(.+)/
        true
      else
        super
      end
    end

    def run_method(class_name, method_name, *args)
      full_class = "ThreePLCentral::" + camelize(class_name)
      constantize(full_class).send(method_name.to_sym, *args)
    end
  end
end