class ToDoList 
    def initialize
        @tasks = Array.new
    end

    def menu
        loop do 
            puts " ----------- To Do List ----------- "
            puts "1. Adicionar Tarefa"
            puts "2. Listar Tarefas"
            puts "3. Remover Tarefa"
            puts "4. SAIR"

            print "Escolha uma opção: "
            case gets.chomp
            when "1"
                add_task
            when "2"
                list_tasks
            when "3"
                remove_task
            when "4"
                puts "Desligando..."
                break
            else
                puts "Opção Inválida! Por Favor, Tente Novamente."
            end
        end
    end

    private 

    def add_task
        print "Digite a tarefa: "
        task = gets.chomp
        if task.strip.empty?
            puts "A tarefa não pode ser vazia."
        else
            @tasks << task
            puts "Tarefa #{task} Adicionada!"
        end
    end

    def list_tasks
        puts " ----------- Suas Tarefas ----------- "
        if @tasks.empty?
            puts "Lista Vazia"
        else
            @tasks.each_with_index do |task, index|
                puts "#{index + 1}, #{task}"
            end
        end
    end

    def remove_task 
        list_tasks
        return if @tasks.empty?

        print "Digite o número da tarefa que deseja remover: "
        index = gets.chomp.to_i
        if index.between?(1, @tasks.length)
            delete_task = @tasks.delete_at(index - 1)
            puts "Tarefa Excluída com Sucesso! - #{delete_task}"
        else
            puts "Número Inválido! Tente Novamente."
        end
    end
end


ToDoList.new.menu