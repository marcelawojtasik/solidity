// SPDX-License-Identifier: MIT

//TaskManager:Programa en solidity que simule un trello en donde pueda agregar tareas, hacerles un update del status 
//y obtener la primer tarea en estado pendiente. 
//Puede extenderse a obtener todas las tareas, a borrar la ultima o incluso una del medio (reacomodando luego el resto). 
//También puede plantearse ahorro de gas mediante el uso de mapping

pragma solidity >=0.8.2 <0.9.0;

contract TestManager{

    enum TaskStatus{ //son uint8, puedo poner hasta 256 enums
        Pending,
        InProgress,
        Done
    }

    struct Task { //la tarea contiene tipos de datos distintos
        uint256 id;
        string title;
        TaskStatus status;
    }

    event TaskCreated (uint256 indexed id, string title);
    //creamos log sobre generacion de la tarea. Con indexed convierto en topic

    Task[] public tasks; //necesito persistir las tareas
    uint256 public taskCounter; //se va incrementando con c/tarea
    uint256 constant MAX_TASK = 10;

    //CreateTask
    function createTask(string calldata _title) external {  
        //const interna con _ para diferenciar de variable de estado
        //no modificare title x eso dejo en calldata (menos gas). No puedo return en calldata
        
        //casteo el string a tipo byte para usar el metodo .length
        require(bytes(_title).length > 0, "Empty title");
        //no me puedo pasar con el taskCounter
        if(taskCounter >= MAX_TASK) {
            revert("Maximum achieved");
        }
        tasks.push(Task(taskCounter, _title, TaskStatus.Pending));
        emit TaskCreated (taskCounter, _title);
        taskCounter++;
    }

    //creo modificador para asegurarme no ingresar un id inexistente en el update
    modifier validTaskIndex(uint256 _index){ //index es el id
        require(_index < tasks.length, "Id does not exist");
        _;
    }

    //UpdateTaskStatus
    function updateTaskStatus(uint256 _id, TaskStatus _status) external validTaskIndex(_id){
        tasks[_id].status = _status; 
    }

    //ReadNextToDo - no consume gas payable
    function readNextToDo() external view returns (Task memory){ //q me devuelva la 1ra pending
       uint256 taskLength = tasks.length;  //accedo una sola vez a variable de estado (en storage)

        for(uint256 i=0; i < taskLength; i++) {
            if(tasks[i].status == TaskStatus.Pending){
                return tasks[i];
            }
        }
        return tasks[taskLength-1]; //si no hay Pending, q me tire la última
    }

    //DeleteLastTask
    //HACER CON POP EN LUGAR DE PUSH

}
