{:user {:plugins [[lein-kibit "0.0.8"]
                  [lein-midje "3.0.0"]
                  [lein-typed "0.3.5"]
                  [jonase/eastwood "0.1.4"]]
        :dependencies [[clj-stacktrace "0.2.7"]
                       [spyscope "0.1.5"]
                       [redl "0.2.4"]]
        :injections [(require 'spyscope.core)
                     (require '[redl complete core])
                     (let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                            'print-cause-trace)
                           new (ns-resolve (doto 'clj-stacktrace.repl require)
                                           'pst)]
                       (alter-var-root orig (constantly (deref new))))]}}
