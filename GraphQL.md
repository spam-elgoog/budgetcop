### Available Queries and Mutations

<pre>
mutation signIn{
  signInUser(input:{
    auth:{
      username: "peterspam"
      password: "tophat.made"
    }
  }){
    user{
      fName
      lName
    }
    token
    errors
  }
}

mutation create_expense {
	createExpense(input:{
    attributes: {
      planId: 2
      details: "Instagram Ads"
      category: ads
      amount: 55
    }
  }) {
    id
  	errors
  }
}

query expenses{
  allExpensesByPlanId(planId: 2, amountsOption: COMBINED){
    id
    details
    amount
    budgetPlanId
    category{
      id
      category
      shortDesc
      fullDesc
    }
  }
}

mutation create_detail_for_plan {
  createPlanDetail(input:{
    userId: 1
    budgetPlanId: 1
    attributes: [
			{
        categoryType: storage
        amount:1230
    	},{
        categoryType: misc
        amount: 150.99
    }]
  }) {
    	errors
  }
}
    
query planById {
	allPlansByUserId(userId: 4, contentChoice: NEWEST){
    id
    planDate
    year
    month
  }
}
query plans_by_user {
	allPlansByUserId(userId: 4, contentChoice: ALL) {
    id
    planDate
    year
    month
  }
}


query users {
  allUsers {
    id
    fName
    lName
    userName
    email
  }
}

query cats {
  allCategories {
    id
    category
    shortDesc
    fullDesc
  }
}

query plan_details {
  allDetailsByPlanId(planId: 2){
    budgetPlanId
    id
    amount
    category{
      id
      category
      shortDesc
      fullDesc
    }
  }
}


query one_user {
  user(id: 4) {
    id
    fName
    lName
    userName
    email
  }
}

mutation delete_detail_by_id {
  deleteDetail(input: {id: 73}) {
    detail{
    	budgetPlanId
      id
      amount
      category{
        id
        category
				shortDesc
        fullDesc
    	}
    }
    errors
  }
}

mutation delete_user_by_id {
  deleteUser(input:{id: 1}){
    user{
      fName
      lName
      email
      userName
    }
    errors
  }
  
}

mutation create_user {
  createUser(input: {
    attributes: {
      fName: "Bob",
      lName: "Sanders",
      email: "bob@gm.com",
      userName: "bobsanders",
      password: "password",
      passwordConfirmation: "password"}}) {
    user {
      id
      fName
      lName
      userName
      email
    }
    errors
  }
}

mutation delete_plan {
  deletePlan(input: {userId: 2, planId: 26}) {
    budgetPlan {
      id
      planDate
    }
    errors
  }
}

mutation create_plan {
  createPlan(input: {userId: 2, planDate: "2019-07-08"}) {
    budgetPlan {
      id
      planDate
      year
      month
    }
    errors
  }
}
</pre>