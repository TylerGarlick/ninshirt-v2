import { ApolloServer, gql } from 'apollo-server'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()


// console.log(prisma)

const typeDefs = gql`

  type Account {
    name: String
    email: String
  }
  type Query {
    accounts: [Account]
    me: Account
  }



  input AccountRegistration {
    name: String
    email: String
  }

  type RegistrationResults {
    userId: String
    email: String
    name: String
  }

  type Mutation {
    register(account: AccountRegistration): RegistrationResults
    forgotPassword(email: String): Boolean
    resetPassword(email: String, resetCode: String, newPassword: String): Boolean
  }
`;

const resolvers = {
  Query: {
    async accounts() {
      return []
    },

    async me() {
      return {
        userId: ``,
        email: ``,
        name: ``
      }
    }
  },

  Mutation: {
    async register() {
      return {
        userId: ``,
        email: ``,
        name: ``
      }
    },

    async forgotPassword() {
      return true
    },

    async resetPassword() {
      return true
    }
  }
};


const server = new ApolloServer({ typeDefs, resolvers });

// The `listen` method launches a web server.
server.listen().then(({ url }) => {
  console.log(`🚀  Server ready at ${url}`);
});
