class PolyTreeNode
    attr_reader :value, :parent, :children

    def initialize(value, parent = nil)
        @value = value
        @parent = parent
        @children = []
    end

    def parent=(other_parent)
        return  if self.parent == other_parent                     
        if self.parent
            self.parent.children.delete(self) 
        end
        @parent = other_parent
        other_parent.children << self unless other_parent.nil?
        self
    end

    def add_child(child)
        child.parent = self
    end

    def remove_child(child)
        if child && !self.children.include?(child)
            raise "error"
        end
        child.parent = nil
    end


    def dfs(value, &prc)
        return self if prc.call(value)

        
    end
end
