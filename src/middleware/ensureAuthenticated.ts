import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";


export function ensureAuthenticated(request: Request, response: Response, next: NextFunction) {
  const authToken = request.headers.authorization

  if (!authToken) {
    return response.status(401).json({
      message: "Token is missing",
    })
  }

  const [, token] = authToken.split(" ")

  try {
    verify(token, "d8fc7113-b443-4b88-bdd7-dfe8f3d52d87")

    return next()
  } catch (err) {
    return response.status(401).json({
      message: "Token invalid"
    })
  }
}