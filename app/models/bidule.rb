class Bidule < ApplicationRecord

  def self.feed_the_bidule
    226000.times do |i|

      ids = []
      (3 + rand(500)).times do
        ids << rand(5000)
      end

      b = Bidule.new
      b.liste_gin_ids = ids
      b.liste_btree_ids = ids
      b.liste_none_ids = ids
      b.save

      if i.divmod(1000)[1] == 0
        puts i
      end

    end
  end

  def self.bench
    require 'benchmark'

    ids_to_find = []
    10.times do
      ids_to_find << rand(5000)
    end

    Benchmark.bm(7) do |x|
      x.report("gin + @>")   {
        ids_to_find.each{ |id|
          Bidule.where("liste_gin_ids @> ?", "{#{id}}").count
        }
      }
      x.report("btree + @>") {
        ids_to_find.each{ |id|
          Bidule.where("liste_btree_ids @> ?", "{#{id}}").count
        }
      }
      x.report("none + @>")  {
        ids_to_find.each{ |id|
          Bidule.where("liste_none_ids @> ?", "{#{id}}").count
        }
      }
      x.report("gin + ANY")   {
        ids_to_find.each{ |id|
          Bidule.where("? = ANY (liste_gin_ids)", id).count
        }
      }
      x.report("btree + ANY") {
        ids_to_find.each{ |id|
          Bidule.where("? = ANY (liste_btree_ids)", id).count
        }
      }
      x.report("none + ANY")  {
        ids_to_find.each{ |id|
          Bidule.where("? = ANY (liste_none_ids)", id).count
        }
      }
    end
  end

end
