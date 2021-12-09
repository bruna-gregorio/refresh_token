import { sign } from "jsonwebtoken"


class GenerateTokenProvider {
  async execute(userId: string) {
    const token = sign({}, "d8fc7113-b443-4b88-bdd7-dfe8f3d52d87", {
      subject: userId,
      expiresIn: "20s"
    })

    return token
  }
}

export { GenerateTokenProvider }