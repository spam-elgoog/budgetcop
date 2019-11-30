### Available Queries and Mutations

<pre>
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

query plans_by_user{
	allPlansByUserId(id:2){
    id
    planDate
  }
}

query plan_details{
  allDetailsByPlanId(id:2){
    budgetPlanId
    id
    categoryId
    amount
    
  }
}

query plan_expenses{
  allExpensesByPlanId(id:2){
    budgetPlanId
    id
    details
    categoryId
    amount
  }
}

query one_user{
  user(id:3){
    id
    fName
    lName
    userName
    email
    plansCount
  }
}
mutation delete_detail_by_id {
  deleteDetail(input:{
    id:15})
  {
    budgetPlanId
    id
    categoryId
    amount
  }
}

mutation delete_user_by_id{
  deleteUser(input:{
    id:8
  }) {
    id
    fName
    lName
    userName
    id
    email
  }
}
mutation create_user{
  createUser(input:{
  	fName: "Mike"
    lName: "Sanders"
    email: "mike@gm.com"
    userName: "mikesanders"
    password: "password"
    passwordConfirmation: "password"
  }){
    user{
      id
      fName
      lName
      email
      userName
    }
  }
}
</pre>