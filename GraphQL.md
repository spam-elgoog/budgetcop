### Available Queries and Mutations

<pre>
query planById {
  allPlansByUserId(id: 2) {
    id
    month
    planDate
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

query plans_by_user {
  allPlansByUserId(id: 2) {
    id
    planDate
    year
    month
  }
}

query plan_details {
  allDetailsByPlanId(id: 2) {
    budgetPlanId
    amount
    id
    categoryId
    category
    shortDesc
  }
}
# create similar but with totals of expenses
query plan_expenses {
  allExpensesByPlanId(id: 2) {
    budgetPlanId
    id
    details
    categoryId
    amount
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
  deleteDetail(input: {id: 15}) {
    detail {
      id
      categoryId
      amount
    }
    errors
  }
}

mutation delete_user_by_id {
  deleteUser(input: {id: 8}) {
    id
    fName
    lName
    userName
    id
    email
  }
}

mutation create_user {
  createUser(input: {attributes: {fName: "Bob", lName: "Sanders", email: "bob@gm.com", userName: "bobsanders", password: "password", passwordConfirmation: "password"}}) {
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
  deletePlan(input: {userId: 2, id: 26}) {
    budgetPlan {
      id
      planDate
    }
    errors
  }
}

mutation create_plan {
  createPlan(input: {id: 2, planDate: "2019-08-08"}) {
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