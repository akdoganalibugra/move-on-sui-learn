module 0x42::SocialNetwork {
    use std::vector;

    struct Friends has store, key, drop {
        people: vector<Person>
    }

    struct Person has store, key, drop, copy {
        name: vector<u8>,
        age: u8 
    }

    public fun create_friend(myFriend: Person, friends: &mut Friends): Person {
        let newFriend = Person {
            name: myFriend.name,
            age: myFriend.age,
        }; 

        add_friend(newFriend, friends);
        return newFriend
    }

    public fun add_friend(_person: Person, friends: &mut Friends) {
        vector::push_back(&mut friends.people, _person)
    }

    #[test]
    fun test_create_friend() {
        let richard = Person {
            name: b"Richard",
            age: 31
        };

        let friends = Friends {
            people: (vector[richard])
        };

        let createdFriend = create_friend(richard, &mut friends);
        assert!(createdFriend.name == b"Richard", 0);
    }
}