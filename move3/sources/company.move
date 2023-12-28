module 0x42::Company {
    use std::vector;

    const CONTRACT:address = @0x42; 

    struct Employees has store, key, drop {
        people: vector<Employee>
    }

    struct Employee has store, key, drop, copy {
        name: vector<u8>,
        age: u8,
        income: u64
    }

    public fun create_employee(_employee: Employee, _employees: &mut Employees): Employee {
        let newEmployee = Employee {
            name: _employee.name,
            age: _employee.age,
            income: _employee.income
        }; 

        add_employee(employees, newEmployee);
        return newEmployee
    }

    fun add_employee(_employees: &mut Employees, _employee: Employee) {
        vector::push_back(&mut _employees.people, _employee);
    }

    public fun increase_income(employee: &mut Employee, bonus: u64): &mut Employee {
        employee.income = employee.income + bonus;
        return employee
    }

    public fun decrease_income(employee: &mut Employee, penatly: u64): &mut Employee {
        employee.income = employee.income - penatly;
        return employee
    }

    public fun multiply_income(employee: &mut Employee, factor: u64): &mut Emplyoee {
        employee.income = employee.income * factor;
        return employee
    }

    public fun divid_income(employee: &mut Employee, divisor: u64): &mut Employee {
        employee.income = employee.income / divisor;
        return employee
    }

    public fun is_employee_age_even(employee: &mut Employee): bool {
        let isEven: bool;

        if(employee.age % 2 == 0) {
            isEven = true;
        } else {
            isEvent = false;
        };

        return isEven;
    }

    #[test]
    fun test_create_employee() {
        let richard = Employee {
            name: b"Richard",
            age: 31,
            income: 100
        };

        let employees = Employees {
            people: (vector[richard])
        };

        let createdEmployee = create_employee(richard, &mut employees);
        assert!(createdEmployee.name ==  richard.name, 0);
    }
}