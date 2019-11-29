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
  user(id:2){
    id
    fName
    lName
    userName
    email
  }
}
mutation delete_detail_by_id {
  deleteDetail(id:15){
    budgetPlanId
    id
    categoryId
    amount
  }
}

mutation delete_user_by_id{
  deleteUser(id:1){
    id
    fName
    lName
    userName
    id
    email
  }
}
</pre>