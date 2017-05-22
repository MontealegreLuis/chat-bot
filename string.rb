class String
    def sentences
        gsub(/\n|\r/, '').split(/\.\s*/)
    end

    def words
        scan(/\w[\w\'\-]*/)
    end
end

